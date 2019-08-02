// 1
db.transport.find(
    {"EMPLOYEE.e#":"11"},
    {"EMPLOYEE.trips":false}
).pretty();
// 2
db.transport.find(
    {"EMPLOYEE.position":"mechanic"},
    {"EMPLOYEE.e#":true,"EMPLOYEE.name":true,"EMPLOYEE.position":true}
).pretty();
//  3
db.transport.find(
    {
        $or: [
            {"TRUCK.registration":"PKR768"}, {"TRUCK.registration":"PKR008"},{"TRUCK.registration":"SST005"}
         ]
    },
    {_id:false}
).pretty();
 
// db.transport.find(
//     {EMPLOYEE: {
//          $exists: true
//          }
//     }
// ).pretty();
// 3
db.transport.find(
    {EMPLOYEE: {
         $exists: true
         }
    }
).count();
// 4
db.transport.find(
    {"EMPLOYEE.position":"mechanic"}
).count();
// 5
db.transport.find(
    {"EMPLOYEE.name":"John Fox"},
    {"EMPLOYEE.maintenances.registration":true}
).pretty();
// 6
db.transport.find(
    {"EMPLOYEE.maintenances.registration":"LUCY01"},
    {_id:false,"EMPLOYEE.name":true}
).pretty();
// 7
db.transport.find(
    {"EMPLOYEE.trips": {
        $exists: false
        },TRUCK: {
            $exists: false
            }
   },
    {_id:false,"EMPLOYEE.name":true}
).pretty();