/**************************************************************/
/*   It is required to use Array.prototype methods            */
/*   when iterating over a sales team's array of employees.   */
/**************************************************************/

var SalesTeam = function (employees) {
  this.employees = employees;
}

SalesTeam.prototype.find = function(word){
  employee = this.employees.filter(function(employee){
    return employee.firstName == word;});
  return employee[0];
}

// "returns the employees with total sales of at least 2500"
SalesTeam.prototype.bonusEarners = function()  {
  return this.employees.filter(function(employee){
    return employee.totalSales() >= 2500;
  });
}

//
// myra =   new Employee({firstName: "Myra", sales: [900, 700, 1000, 750]});  // Total sales: 3350
// jalil =  new Employee({firstName: "Jalil", sales: [100, 300, 800, 200]});  // Total sales: 1400
// irene =  new Employee({firstName: "Irene", sales: [200, 1000, 1000, 500]}) // Total sales: 2700
// kelvin = new Employee({firstName: "Kelvin", sales: [800, 100, 750, 100]}); // Total sales: 1750
//
// employees = [jalil, irene, myra, kelvin];
//
// team = new SalesTeam(employees);
// });
//
// console.log(team.find("Irene"));
// console.log(team.employees.length);
// console.log(team.bonusEarners());
