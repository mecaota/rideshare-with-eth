pragma solidity ^0.4.25;
contract GpsSpotRegister {
	struct Spot{
		uint256 index;
		string name;
		int32 x;
		int32 y;
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
	function set(string __spotname, int32 _x, int32 _y) public returns (uint256){
		bytes32 bytes_str = stringToBytes32(__spotname);
		uint256 raw_index = spotname_list.push(bytes_str)-1;
		spot_list[bytes_str] = Spot(raw_index, __spotname, _x, _y);
		return raw_index;
	}
	function get_x(string __spotname) public view returns (int32){
		return spot_list[stringToBytes32(__spotname)].x;
	}
	function get_y(string __spotname) public view returns (int32){
		return spot_list[stringToBytes32(__spotname)].y;
	}
	function get_spot(string __spotname) public view returns (uint256, string, int32, int32){
		Spot target = spot_list[stringToBytes32(__spotname)];
		return (target.index, target.name, target.x, target.y);
	}
	function get_spotlist() public view returns (bytes32[]){
		return spotname_list;
	}
}
