<?php
define('WP_USE_THEMES', true);
require_once('../../../wp-load.php');
require_once "modules/main_function.method.php";
if (isset($_POST['action'])) {
    $action = $_POST['action'];
    switch ($action) {
        // user charge credit
        case 'charge_credit':
            if (isset($_POST['user_id']) && isset($_POST['credit_fee'])) {
                $user_id = $_POST['user_id'];
                $credit_fee = $_POST['credit_fee'];
                list($result, $msg) = charge_credit($user_id, $credit_fee, credit_operator_name_0, credit_operation_name_0, 'شارژ حساب');
            } else {
                $result = false;
                $msg = 'درخواست نامعتبر است';
            }
            echo json_encode(array('flag' => $result, 'msg' => $msg));
            break;

        default:
            echo 'خطا - درخواست نامعتبر است';
    }
} else {
    echo 'خطا - درخواست شما نامعتبر است';
}