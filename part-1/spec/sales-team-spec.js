describe("SalesTeam", function() {
  var team, employees, jalil, irene, kelvin, myra;

  beforeEach(function() {
    // Define employee objects
    myra =   new Employee({firstName: "Myra", sales: [900, 700, 1000, 750]});  // Total sales: 3350
    jalil =  new Employee({firstName: "Jalil", sales: [100, 300, 800, 200]});  // Total sales: 1400
    irene =  new Employee({firstName: "Irene", sales: [200, 1000, 1000, 500]}) // Total sales: 2700
    kelvin = new Employee({firstName: "Kelvin", sales: [800, 100, 750, 100]}); // Total sales: 1750

    // Assign employees
    employees = [jalil, irene, myra, kelvin];

    // Assign sales team
    team = new SalesTeam(employees);
  });

  describe("employees", function() {
    it("has employees", function() {
      expect(team.employees).toEqual(employees);
    });
  });

  describe("finding an employee by name", function() {
    it("returns an employee with that first name", function() {
      expect(team.find("Irene")).toEqual(irene);
    });

    it("does not change the number of employees", function() {
      var lengthBeforeMethodCall = team.employees.length;
      team.find("Irene");
      expect(team.employees.length).toEqual(lengthBeforeMethodCall);
    });
  });

  describe("identifying the employees who've earned a bonus", function() {
    it("returns the employees with total sales of at least 2500", function() {
      expect(team.bonusEarners()).toEqual(jasmine.arrayContaining([myra, irene]));
    });

    it("does not change the number of employees", function() {
      var lengthBeforeMethodCall = team.employees.length;
      team.bonusEarners();
      expect(team.employees.length).toEqual(lengthBeforeMethodCall);
    });
  });
});
