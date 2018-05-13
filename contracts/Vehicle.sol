pragma solidity ^0.4.23;

import "openzeppelin-solidity/contracts/token/ERC721/ERC721Token.sol";

contract Vehicle is ERC721Token {
  address internal _owner;

  struct Asset {
    string vin;
  }

  Asset[] vehicles;

  event LocationChange(address _owner, string _previous, string _after);
  event VehicleIssue(address _owner, Asset _vehicle, uint256 _tokenId);

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
    emit VehicleIssue(msg.sender, vehicle, newVehicleId);
    super._mint(msg.sender, newVehicleId);
  }
}
