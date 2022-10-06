<?php
//****************************** credit ******************************
function charge_credit($user_id, $new_credit, $operator_name, $operation_name, $transaction_dis)
{
    list($flg, $agent_id, $previous_credit) = get_credit($user_id);
    if ($flg) {
        $flg = update_credit($agent_id, $user_id, $operator_name, $previous_credit, $operation_name, $new_credit, $transaction_dis);
    } else {
        $flg = set_credit($agent_id, $operator_name, '0', $operation_name, $new_credit, $transaction_dis);
    }
    return $flg;
}

function get_credit($user_id)
{
    global $wpdb;
    $sql = "`user_id`='" . $user_id . "' and `status`='1'";
    $result = $wpdb->get_row("SELECT * FROM `user_credits` WHERE " . $sql);
    if ($result) {
        $credits_id = $result->credits_id;
        $credit_fee = $result->credit_fee;
        return array(true, $credits_id, $credit_fee);
    } else {
        return array(false, $user_id, 0);
    }
}

function set_credit($user_id, $operator_name, $previous_credit, $operation_name, $new_credit, $transaction_dis, $status = '1')
{
    global $wpdb;
    $data_array = array(
        'user_id' => $user_id,
        'credit_fee' => $new_credit,
        'status' => $status
    );
    $result = $wpdb->insert('user_credits', $data_array);
    if ($result) {
        $amount_transaction = $new_credit;
        set_credit_log($user_id, $operator_name, $previous_credit, $operation_name, $new_credit, $amount_transaction, $transaction_dis);
        return array(true, 'تراکنش شما با موفقیت انجام شد');
    } else {
        return array(false, 'خطا در انجام تراکنش');
    }
}

function update_credit($credits_id, $user_id, $operator_name, $previous_credit, $operation_name, $new_credit, $transaction_dis)
{
    global $wpdb;
    $previous_credit = floatval($previous_credit);
    $new_credit = floatval($new_credit);

    if ($operation_name == 'sum') {
        $amount_transaction = $previous_credit + $new_credit;
    } else {
        if ($previous_credit >= $new_credit) {
            $amount_transaction = $previous_credit - $new_credit;
        } else {
            $amount_transaction = $new_credit - $previous_credit;
        }
    }

    if ($amount_transaction >= 0) {
        $where = array('credits_id' => $credits_id);
        $data_array = array('credit_fee' => $amount_transaction);
        $result = $wpdb->update('user_credits', $data_array, $where);
        if ($result == '1') {
            set_credit_log($user_id, $operator_name, $previous_credit, $operation_name, $new_credit, $amount_transaction, $transaction_dis);
            return array(true, 'تراکنش با موفقیت انجام شد');
        } else {
            return array(false, 'خطا در تراکنش');
        }
    } else {
        return array(false, 'اعتبار حساب کاربری کم است');
    }
}

//****************************** credit log ******************************
function set_credit_log($user_id, $operator_name, $previous_credit, $operation_name, $new_credit, $amount_transaction, $transaction_dis)
{
    global $wpdb;
    $date_time = get_today() . ' ' . get_TimeNow();
    $data_array = array(
        'user_id' => $user_id,
        'operator_name' => $operator_name,
        'previous_credit' => $previous_credit,
        'operation_name' => $operation_name,
        'new_credit' => $new_credit,
        'amount_transaction' => $amount_transaction,
        'transaction_dis' => $transaction_dis,
        'date_time' => $date_time
    );
    $result = $wpdb->insert('credit_log', $data_array);
    if ($result) {
        return true;
    } else {
        return false;
    }
}

//****************************** main functions ******************************
function get_today()
{
    date_default_timezone_set("America/New_York");
    return date("Y-m-d");
}

function get_TimeNow()
{
    date_default_timezone_set('Asia/Tehran');
    return $date = date('H:i:s', time());
}