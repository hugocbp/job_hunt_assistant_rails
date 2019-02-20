$(document).on("turbolinks:load", function() {
  let $companies = $("select#listing_company_id").selectize({
    valueField: "id",
    labelField: "name",
    create: function(input, cb) {
      $.ajax({
        url: "/companies",
        method: "POST",
        dataType: "json",
        data: {
          company: { name: input }
        },
        success: function(res) {
          console.log(res);
          if (!res.errors) {
            cb({ id: res.id, name: res.name });
          }
        }
      });
    }
  });
});
