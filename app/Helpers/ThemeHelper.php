<?php


//use App\FinanceVendorCity;
//use App\FinanceVendorCityDetail;
//use App\Hub;
//use App\TemporaryPassword;
use Illuminate\Support\Facades\Auth;

function backend_view($file) {
    return call_user_func_array( 'view', ['backend/' . $file] + func_get_args() );
}

function backend_path($uri='') {
    return public_path( 'backend/' . $uri );
}

function backend_asset($uri='') {
    return asset( 'backend/' . ltrim($uri,'/') );
}

/*public assets */
function app_asset($uri='') {
    return asset( '/' . ltrim($uri,'/') );
}

function backend_url($uri='/') {
    return call_user_func_array( 'url', ['/' . ltrim($uri,'/')] + func_get_args() );
}

function constants($key) {
    return config( 'constants.' . $key );
}

function institute_view($file) {
    return call_user_func_array( 'view', ['institute/' . $file] + func_get_args() );
}

function institute_path($uri='') {
    return public_path( 'institute/' . $uri );
}

function institute_asset($uri='') {
    return asset( 'public/backend/' . ltrim($uri,'/') );
}

function institute_url($uri='/') {
    return call_user_func_array( 'url', ['institute/' . ltrim($uri,'/')] + func_get_args() );
}

function SlugMaker($value,$replacement ='_')
{
    $value = trim(strtolower($value));
    $value = preg_replace("/-$/","",preg_replace('/[^a-z0-9]+/i', $replacement, strtolower($value)));
    return $value;
}

//Mark:- To Fetch The Hub Name All over the project -- Daniyal Khan
function getHubTitle()
{
    //new-logic
    $auth_user = Auth::user();
    $hub_id = $auth_user->hub_id;
    $hub_detail = Hub::where('id', $hub_id)->get();
    $hub_name = $hub_detail[0]->title;
    return  $hub_name;
}

function  check_permission_exist($permission,$matching_array)
{
    return in_array(explode('|',$permission)[0],$matching_array);

}
/*this function check the user have permission to access this route */
function  can_access_route($matching_data_value,$permission_data_array)
{
    //checking the current user is super admin

    //getting super admin role id
    $super_admin_role_id = config('app.super_admin_role_id');

    if(Auth::user()->role_type == $super_admin_role_id)
    {
        return true;
    }

    // checking the matching data type is array or string
    $matching_data_value_type = gettype($matching_data_value);
    if($matching_data_value_type == 'string')
    {
        //checking the route name exist in permissions array
        return in_array($matching_data_value,$permission_data_array);
    }
    elseif($matching_data_value_type == 'array')
    {
        //checking the route names exist in permissions array
        $matching_count = count(array_intersect($matching_data_value,$permission_data_array));
        return ($matching_count > 0) ? true :false;
    }

    // default return false
    return false;


}




//Mark:- To assing permission to user on Micro Hub -- Daniyal Khan
function  can_user_access_route($matching_data_value)
{

    //Mark:- Checking User Credential...
    $auth_user = Auth::user();
    $hubPermissoins = $auth_user->hubPermissions();

    //Mark:- Comparing input and calculated value to return true or false...
    foreach ($hubPermissoins as $id) {
        if($id == $matching_data_value){
            return true;
        }
    }
    return false;
}
//End Permission Function Here



/*function for calculate  difference between created time and current time of temporary password*/
//Mark:- This function will be use in future -- Daniyal Khan
function temporaryPasswordValidation()
{
    $auth_user = Auth::user();
    $user_id = $auth_user->id;

    $generated_password = TemporaryPassword::where('user_id',$user_id)->where('is_valid',1)->get();

    if(count($generated_password) > 0){
        foreach ($generated_password as $data){
            $created_at = $data->created_at;
        }

        $created_time = $created_at;
        $current_time = date("Y-m-d H:i:s");

        $diff = array();
        $created = strtotime($created_time);
        $current = strtotime($current_time);
        $datediff = abs($created - $current);

        $diff['minutes'] = floor($datediff/(60));

        if($diff['minutes'] >= 20){

            TemporaryPassword::where('user_id', $user_id)->update(['is_valid' => 0]);

        }

    }

}



/*function for calculate  difference between two date and time*/
function DifferenceTwoDataTime($dataTime1,$dataTime2,$format = 'H:i:s')
{
    // checking the both date are fromted
    if(!DateTime::createFromFormat('Y-m-d H:i:s', $dataTime1)) // checking the date time is format
    {
        return 'start date not set ';
    }
    elseif(!DateTime::createFromFormat('Y-m-d H:i:s', $dataTime2))
    {
        return 'end date not set ';
    }

    $time_diff =  $dataTime1->diff($dataTime2);
    $h = ($time_diff->h >9)?$time_diff->h:'0'.$time_diff->h;
    $m = ($time_diff->i >9)?$time_diff->i:'0'.$time_diff->i;
    $s = ($time_diff->s >9)?$time_diff->s:'0'.$time_diff->s;
    return $h.':'.$m.':'.$s;
}



function HasPermissionAccess($user_type,$matching_data,$permissions_array)
{
    /*checking user type*/
    if($user_type == 'admin')
    {
        return true;
    }

    /*now checking matching data data type */
    $matching_data_type = gettype($matching_data);
    if($matching_data_type == 'array')
    {
        $match_data = count(array_intersect($permissions_array,$matching_data));
        if($match_data > 0)
        {
            return true;
        }
    }
    elseif($matching_data_type == 'string')
    {
        return in_array($matching_data,$permissions_array);
    }

    //default return typ false
    return false;

}

function getStatusCodesWithKey($type = null)
{
    if($type != null)
    {
        $status_codes = config('statuscodes.'.$type);
    }
    else
    {
        $status_codes = config('statuscodes');
    }
    return $status_codes;
}

function getStatusCodes($type = null)
{
    if($type != null && $type != '')
    {
        $status_codes = config('statuscodes.'.$type);
        $status_codes = array_values($status_codes);
    }
    else
    {
        $status_codes = config('statuscodes');
        foreach($status_codes as $key => $value)
        {
            $status_codes[$key] = array_values($value);
        }

    }

    return $status_codes;
}

// function  to convert datetime  string to other  time zons
function ConvertTimeZone($dataTimeString,$CurrentTimeZone = 'UTC' ,$ConvertTimeZone = 'UTC',$format = 'Y-m-d H:i:s')
{
    return Carbon\Carbon::parse($dataTimeString, $CurrentTimeZone)->setTimezone($ConvertTimeZone)->format($format);
}

// ca phone convertor

function convert_ca_number_standard($value)
{
    return '+1'.preg_replace('/[\W\D]+/i', '', $value);
}

function convert_ca_number_formatted($value)
{
    $raw_phone_no = $value;
    $formatted_phone_no = '('.substr($value,2,3).') '.substr($value,5,3).'-'.substr($value,8);
    return $formatted_phone_no;
}
