let hello = 'こんにちは';
console.log(hello);

document.addEventListener("turbolinks:load", function() {
  $(function() {
    Payjp.setPublicKey('pk_test_d9d5358cfdfab733fb8af0ef');
    $("#credit-btn").on('click', function(e) {
      e.preventDefault();
  
      let card = {
        number: $('#card-number').val(),
        cvc: $('#cvc').val(),
        exp_month: $('#card-month').val(),
        exp_year: $('#card-year').val()
      };
  
      Payjp.createToken(card, function(status, response) {
        if (status === 200) {
          $('#cardForm').prop('disabled', false);
          window.alert("カード情報が正しくありません");
        }
        else {
          $('#card-number').removeAttr("name");
          $('#card-cvc').removeAttr("name");
          $('#card-month').removeAttr("name");
          $('#card-year').removeAttr("name");
          $('#card_token').append(
            $('<input type="hidden" name="payjp-token">').val(response.id)
          );
          document.inputForm.submit();
          window.alert("登録が完了しました");
        }
      });
    });
  });
});


