pragma solidity ^0.4.23;

import "openzeppelin-solidity/contracts/token/ERC721/ERC721Token.sol";

contract Vehicle is ERC721Token {
  address internal _owner;

  struct Asset {
    string vin;
  }

  Asset[] vehicles;

  event VehicleIssue(address indexed _owner, string _vehicle, uint256 _tokenId);

  modifier onlyOwner() {
    require(msg.sender == _owner);
    _;
  }

  constructor(string _name, string _symbol) ERC721Token(_name, _symbol) public {
    _owner = msg.sender;
  }

  function issue(string _vin) onlyOwner public {
    Asset memory vehicle = Asset({vin: _vin});
    uint256 newVehicleId = vehicles.push(vehicle) - 1;
    emit VehicleIssue(msg.sender, vehicle.vin, newVehicleId);
    super._mint(msg.sender, newVehicleId);
  }
}
