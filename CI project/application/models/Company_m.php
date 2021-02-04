<?php
class Company_m extends CI_Model {
	function __construct() {
        $this->load->database();
    }
    
    public function search($content)
    {
        $this->db->like('name',$content);
        $this->db->like('ein',$content);
        $this->db->or_like('doing_business_as',$content);
        $this->db->or_like('type_of_business',$content);
        $this->db->or_like('phone',$content);
        $this->db->or_like('address',$content);
        $this->db->or_like('city',$content);
        $this->db->or_like('state',$content);
        $this->db->or_like('zip',$content);
        $this->db->or_like('mailing_address',$content);
        $this->db->or_like('mailing_address_2',$content);
        $this->db->or_like('mailing_city',$content);
        $this->db->or_like('mailing_state',$content);
        $this->db->or_like('mailing_zip',$content);
        $this->db->or_like('cik',$content);
        $this->db->or_like('end_of_fiscal_year',$content);
        $this->db->or_like('incorporation_state',$content);
        $this->db->or_like('incorporation_sub_division',$content);
        $this->db->or_like('incorporation_country',$content);
        $this->db->or_like('filing_year',$content);
        $query=$this->db->get('companies');
        return $query->result();
      
    }
    public function index_read($id)
    {
        $this->db->where('id',$id);
        $query=$this->db->get('companies')->row_array();
        return $query;
    }
    

}