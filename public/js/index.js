// Instantiate controller
const controller = new Controller();

// Operate upon fetched admins
controller.fetchAdmins(admins => {
  adminsList = JSON.parse(admins);
  adminsList.forEach(admin => {
    $("#admins-list").append(`<li class="list-group-item">${admin.name}</li>`);
  });
});
