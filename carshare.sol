ragma solidity ^0.4.24;
contract CarSharingService {
	struct Car{
		address caddr; //Car address
		address uaddr; //User address
		int time; //Using time
		bytes32 pos_s; //Start car position
		bytes32 pos_e; //End car position
		bytes32 ukey; //Available ticket
		bytes32 data; //Car data
		bool status; //Car use frag
	}
	address public owner;
	bytes32 private okey;
	Car[] public cars:
	function prepareCar public(address __car, uint __continue, bytes32 __key, uint __index, int __time){
		cars[__index]
	}
	function startSharing public(bytes32 __key, uint __index){
	}
	function updateSharing public(uint __index, uint __pos){
	}
	function continueSharing public(address __car, uint __continue, bytes32 __key, uint __index, int __time){
	}
	function endSharing public(address __car, uint __continue, bytes32 __key, uint __index, int __time){
	}
	function getData public(uint __index){
	}
	function setData public(bytes32 __data, uint __index){
	}
	function get_x() public constant returns (int retVal){
		return gps_x/(10**8);
	}
	function get_y() public constant returns (int retVal){
		return gps_y/(10**8);
	}
}
