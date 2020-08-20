let form = $("#cardCreateForm");
Payjp.setPublicKey('pk_test_d9d5358cfdfab733fb8af0ef');

$("#credit-btn").on("click", function(e) {
  e.preventDefault();

  const card = {
    number: $("#card-number").val(),
    cvc: $("#payment_card_cvc").val(),
    exp_month: $("#exp_month").val(),
    exp_year: $("#exp_year").val(),
  };
  Payjp.createToken(card, function(status, response) {
    form.find("input[type=submit]").prop("disabled", true);

    if(status == 200) {
      $("#card-number").removeAttr("name");
      $("#payment_card_cvc").removeAttr("name");
      $("#exp_month").removeAttr("name");
      $("#exp_year").removeAttr("name");

      let payjphtml = `<input type="hidden" name="payjpToken" value=${response.id}>`
      form.append(payjphtml);

      document.inputForm.submit();
    } else {
      alert("カードの登録に失敗しました")
    }
  });
});