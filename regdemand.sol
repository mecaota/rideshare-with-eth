pragma solidity ^0.4.26;
pragma experimental ABIEncoderV2;
contract Demand_Controller {
    
    struct Spot{
        string name;
        int32 x;
        int32 y;
    }
    
    struct Demand{
        bool enabled;
        uint reg_date;
        uint est_date;
        Spot dept;
        Spot arrv;
        uint passengers;
        address[] members;
        address owner;
    }
    
    mapping(address => uint) demand_index;
    Demand[] demand_list;
    
    // コンストラクタ
    constructor () public {
        demand_list.push(
            Demand({
                enabled: false,
                reg_date: 0,
                est_date: 0,
                dept: Spot({name: "", x: 0, y: 0}),
                arrv: Spot({name: "", x: 0, y: 0}),
                passengers: 0,
                members: address[],
                owner: msg.sender
            })
            );
    }
    
    function set(
    uint __passengers,
    uint64 __est_date,
    string dept_name,
    int32 dept_x,
    int32 dept_y,
    string arrv_name,
    int32 arrv_x,
    int32 arrv_y)
    public returns (bool){
        require(demand_index[msg.sender]==0);
        demand_index[msg.sender] = demand_list.push(
            Demand({
                enabled: true,
                reg_date: now,
                est_date: __est_date,
                dept: Spot({name: dept_name, x: dept_x, y: dept_y}),
                arrv: Spot({name: arrv_name, x: arrv_x, y: arrv_y}),
                passengers: __passengers,
                members: address[],
                owner: msg.sender
                
            })
            );
        return true;
    }
    
    function delete_demand(address owner) public returns (bool) {
        uint __index = demand_index[msg.sender];
        require(__index!=0);
        delete demand_index[msg.sender];
        demand_list[__index].enabled = false;
        return true;
    }
    
    function change_passengers(uint __index) public returns (bool) {
        Demand memory demand = demand_list[__index];
        require(demand.enabled==true && demand.passengers > 0);
        demand_list[__index].passengers--;
        return true;
    }
    
    function get_demand(uint __index) public view returns (uint, uint, uint8, string, int32, int32, string, int32, int32){
        Demand memory demand = demand_list[__index];
        Spot memory dept_spot = demand.dept;
        Spot memory arrv_spot = demand.arrv;
        return (demand.reg_date, demand.est_date, demand.passengers, dept_spot.name, dept_spot.x, dept_spot.y, arrv_spot.name, arrv_spot.x, arrv_spot.y);
    }
    
    function get_demandlist() public view returns (Demand[]){
        return demand_list;
    }
}