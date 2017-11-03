/*********************************************************/
/*   It is required to use a for loop                    */
/*   when iterating over an employee's array of sales.   */
/*********************************************************/

var Employee = function (hash) {
  this.firstName = hash.firstName;
  this.sales = hash.sales;
}


Employee.prototype.totalSales = function (){
  return this.sales.reduce(function(total , num){return total + num});
}

Employee.prototype.averageSales = function (){
  return (this.totalSales()/(this.sales.length));
}


// var employee = new Employee({firstName: "Lysette", sales: [500, 100, 250, 1000]});
//
// console.log(employee.firstName);
// console.log(employee.sales);
// console.log(employee.totalSales());
// console.log(employee.averageSales());
