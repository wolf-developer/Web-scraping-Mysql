<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	function __construct() {
        parent::__construct();
        $this->load->model('Company_m');
    }
	public function index()
	{
		$this->load->view('search');
	}
	public function search()
    {
        $content=$this->input->get_post('content');
        $data['customers']=$this->Company_m->search($content);
        $this->load->view('company_search_list',$data);
	}
	public function index_read()
	{
		$id=$this->input->get_post('id');
		$data=$this->Company_m->index_read($id);
		echo json_encode($data);
	}
}
