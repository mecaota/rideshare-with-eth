pragma solidity ^0.4.25;
contract GpsSpotRegister {
	struct Spot{
		int32 x;
		int32 y;
		string name;
	}
	mapping (bytes32 => Spot) public spot_list;
	bytes32[] public spotname_list;
	function stringToBytes32(string memory source) internal pure returns (bytes32 result) {
		bytes memory tempEmptyStringTest = bytes(source);
		if (tempEmptyStringTest.length == 0) {
			return 0x0;
		}
		assembly {
			result := mload(add(source, 32))
		}
	}
	function set(int32 _x, int32 _y, string __spotname) public{
		bytes32 bytes_str = stringToBytes32(__spotname);
		spot_list[bytes_str] = Spot(_x, _y, __spotname);
		spotname_list.push(bytes_str);
	}
	function get_x(string __spotname) public view returns (int32){
		return spot_list[stringToBytes32(__spotname)].x;
	}
	function get_y(string __spotname) public view returns (int32){
		return spot_list[stringToBytes32(__spotname)].y;
	}
	function get_spot(string __spotname) public view returns (string, int32, int32){
		bytes32 bytes_str = stringToBytes32(__spotname);
		return (spot_list[bytes_str].name, spot_list[bytes_str].x, spot_list[bytes_str].y);
	}
	function get_spotlist() public view returns (bytes32[]){
		return spotname_list;
	}
}
