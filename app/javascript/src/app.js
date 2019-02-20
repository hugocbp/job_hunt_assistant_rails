$(document).on("turbolinks:load", function() {
  let $companies = $("select#listing_company_id").selectize({
    selectOnTab: true,
    createOnBlur: false,
    create: function(input, cb) {
      $.ajax({
        url: "/companies",
        method: "POST",
        dataType: "json",
        data: {
          company: { name: input }
        },
        success: function(res) {
          // console.log(res);
          if (!res.errors) {
            cb({ value: res.value, text: res.text });
          }
          cb();
        }
      });
    }
  });
});
