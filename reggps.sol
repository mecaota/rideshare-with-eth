pragma solidity ^0.4.24;
contract SingleNumRegister {
	int32 gps_x;
	int32 gpx_y;
	function set(int x) public{
		gps_x = x*(10**8);
	}
	function get_x() public constant returns (int retVal){
		return gps_x/(10**8);
	}
	function get_y() public constant returns (int retVal){
		return gps_y/(10**8);
	}
}
