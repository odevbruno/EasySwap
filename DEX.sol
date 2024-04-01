// SPDX-License-Identifier: MIT
pragma solidity >=0.8.25;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import './SmartToken.sol';

contract DEX {
    IERC20 public token;

    event Purchased(uint256 _amount);
    event Sold(uint256 _amount);

    constructor(){
        token = new SmartToken();
    }

    function buy() payable public  {
        uint256 _amount = msg.value;
        uint256 balanceDEX = token.balanceOf(address(this));
        require(_amount > 0, "Insufficient funds");
        require(_amount <= balanceDEX, "No have funds");
        token.transfer(msg.sender, _amount);
        emit Purchased(_amount);
    }

    function sell(uint256 _amount)   public {
        require(_amount > 0 ,"Insufficient funds");
        uint256 allowanceAmountSell = token.allowance(msg.sender, address(this));
        require(allowanceAmountSell >= _amount, "Allowance exceeded");
        token.transferFrom(msg.sender, address(this), _amount);
        payable (msg.sender).transfer(_amount);
        emit Sold(_amount);
    }

}