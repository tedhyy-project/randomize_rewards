<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';

// use namespace
use Restserver\Libraries\REST_Controller;

class Rewards extends REST_Controller {

    function __construct()
    {
        parent::__construct();
        $this->load->model('Rewards_model', 'rewards');
    }

    public function index_get()
    {
        $limitSetting = (int)$this->rewards->getSetting('daily_limit');

        $now = date("Y-m-d");

        $user_id = $this->get('id');

        $user = $this->rewards->getUser($user_id); 
        if(!empty($user)){

            //cek user_daily_reward
            $userReward = $this->rewards->getUserRewards($user_id, $now);
            if(!empty($userReward)){
                $rewards = $userReward['rewards'];
            }
            else{
                //random
                $low = $user['low'];
                $high = $user['high'];
                $rewards = rand($low/1000,$high/1000);
                $rewards = $rewards * 1000;

                $totalRewardsToday = $this->rewards->totalRewardsToday();
                $limitLeft = $limitSetting - $totalRewardsToday;
                if ($rewards > $limitLeft) {
                    $rewards = $limitLeft;
                }

                $data = [
                    'user_id' => $user_id,
                    'rewards' => $rewards,
                    'date' => $now,
                ];

                $insert = $this->rewards->insertRewards($data);
            }

            $this->response([
                'status' => true,
                'data' => [
                        'user_id' => $user_id,
                        'name' => $user['name'],
                        'reward' => 'your rewards today : '.$this->rupiah($rewards),
                    ]
            ], REST_Controller::HTTP_OK); 

        }
        else{
            $this->response([
                'status' => FALSE,
                'message' => 'No users were found'
            ], REST_Controller::HTTP_NOT_FOUND);             
        }
    }

    function rupiah($angka){
        $hasil_rupiah = "Rp. " . number_format($angka, 0, ".", ".");
        return $hasil_rupiah;
     
    }

}
