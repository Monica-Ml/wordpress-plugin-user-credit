var ajax_timeout = 10000;

function charge_credit() {
    var user_id = $('#user_id').val();
    var credit_fee = $('#credit_fee').val();
    if (credit_fee > 0) {
        var DataString = {
            'action': 'charge_credit',
            'user_id': user_id,
            'credit_fee': credit_fee
        };
        $.ajax({
            url: '../wp-content/plugins/management/ajax_action.php',
            type: 'POST',
            timeout: ajax_timeout,
            data: DataString,
            beforeSend: function () {
                $('#btn_charge_credit').prop('disabled', true);
            },
            error: function (request, status, error) {
                console.log(error);
                $('#btn_charge_credit').prop('disabled', false);
            },
            success: function (data) {
                var obj = JSON.parse(data);
                if (obj.flag == true) {
                    $('#main_modal_body').html('عملیات با موفقیت انجام شد');
                    $('#main_modal').modal('show');
                } else {
                    $('#main_modal_body').html(obj.msg);
                    $('#main_modal').modal('show');
                }
                $('#btn_charge_credit').prop('disabled', false);
            }
        }).done(function () {

        });
    }
}