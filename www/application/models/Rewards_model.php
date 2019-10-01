<?php

class Rewards_model extends CI_Model
{
	public function getUser($id = null){
		return $this->db->get_where('user', ['user_id' => $id])->row_array();
	}

	public function getUserRewards($id, $date){
		return $this->db->get_where('daily_rewards', ['user_id' => $id, 'date' => $date])->row_array();
	}

	public function totalRewardsToday(){
		$date = date("Y-m-d");

		$this->db->select('IFNULL(SUM(rewards),0) as total', false);
		$this->db->from('daily_rewards');
		$this->db->where('date', $date);
		return $this->db->get()->row_array()['total'];
	}

	public function insertRewards($data){
		$this->db->insert('daily_rewards', $data);
		return $this->db->affected_rows();
	}

	public function getSetting($keyword){

		$this->db->select('*');
		$this->db->from('setting');
		$this->db->where('keyword', $keyword);
		return $this->db->get()->row_array()['value'];
	}
}