// SPDX-License-Identifier: MIT


/*
Purpose of the contract
- this contract calculates the payment between the leaders of a firm in a 60/25/15 ratio
*/

 pragma solidity ^0.8.17;

  contract TieredPaymentSplitter{
    
    address payable ceo;
    address payable cto;
    address payable cmo;

   constructor (address payable _ceo, address payable _cto, address payable _cmo) public {
      ceo = _ceo;
      cto = _cto;
      cmo = _cmo;
   }

  function deposit () public payable {
      uint points = msg.value / 100; // we are using this percentage framework for proportionality
      uint amount;
      uint total;

      // Define rates
      uint ceo_rate = 60;
      uint cto_rate = 25;
      uint cmo_rate = 15;

      // start making transfer calls
      uint amount;

      amount = points * ceo_rate;
      ceo.transfer(amount);
      total += amount;


      amount = points * cto_rate;
      cto.transfer(amount);
      total += amount;


      amount = points * cmo_rate;
      cmo.transfer(amount);
      total += amount;
  }

// Add a receive fallback function so it can receive Ether.
  receive () external payable {}

// call this function to know the balance

   function knowRemainingMoney () public view returns (uint) {
      return address(this).balance;
   }
  }
