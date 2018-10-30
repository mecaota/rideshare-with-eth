pragma solidity ^0.4.25;
pragma experimental ABIEncoderV2;
contract Demand_Controller {
	struct Spot{
		string name;
		int32 x;
		int32 y;
	}
	struct Demand{
		uint64 reg_date;
		uint64 est_date;
		Spot dept;
		Spot arrv;
		uint8 passengers;
	}
	Demand[] demand_list ;
	function stringToBytes32(string memory source) internal pure returns (bytes32 result) {
		bytes memory tempEmptyStringTest = bytes(source);
		if (tempEmptyStringTest.length == 0) {
			return 0x0;
		}
		assembly {
			result := mload(add(source, 32))
		}
	}
	function set(uint8 __passengers, uint64 __reg_date, uint64 __est_date, string dept_name, int32 dept_x, int32 dept_y, string arrv_name, int32 arrv_x, int32 arrv_y) public returns (uint){
		return demand_list.push(Demand(__reg_date, __est_date, Spot(dept_name, dept_x, dept_y), Spot(arrv_name, arrv_x, arrv_y), __passengers)) -1;
	}
	function get_deptspot(uint __index) public view returns (string, int32, int32){
		Spot memory spot = demand_list[__index].dept;
		return (spot.name, spot.x, spot.y);
	}
	function get_arrvspot(uint __index) public view returns (string, int32, int32){
		Spot memory spot = demand_list[__index].arrv;
                return (spot.name, spot.x, spot.y);
	}
	function get_demand(uint __index) public view returns (uint64, uint64, uint8, string, int32, int32, string, int32, int32){
		Demand memory demand = demand_list[__index];
		Spot memory dept_spot = demand.dept;
		Spot memory arrv_spot = demand.arrv;
		return (demand.reg_date, demand.est_date, demand.passengers, dept_spot.name, dept_spot.x, dept_spot.y, arrv_spot.name, arrv_spot.x, arrv_spot.y);
	}
	function get_demandlist() public view returns (Demand[]){
		return demand_list;
	}
}
