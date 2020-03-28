// Instantiate controller
const controller = new Controller();

// Operate upon fetched admins
controller.fetchAdmins(admins => {
  adminsList = JSON.parse(admins);
  adminsList.forEach(admin => {
    $("#admins-table.table tbody").append(
      `<tr>
        <td>${admin.admin_id}</td>
        <td>${admin.name}</td>
        <td>${admin.first_last_name}</td>
        <td>${admin.second_last_name}</td>
      </tr>`
    );
  });
});
