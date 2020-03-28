class Controller {
  fetchAdmins(callback) {
    $.ajax({
      type: "GET",
      url: "../src/services/all_admins.php"
    }).done(callback);
  }
}
