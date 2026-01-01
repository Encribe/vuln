// Derived fix of not-so-smart-contracts denial_of_service/auction.sol (Apache-2.0),
// following that repository's README advice: refunds are pulled, not pushed.
pragma solidity ^0.4.15;

contract DosAuctionPull {
  address currentFrontrunner;
  uint currentBid;
  mapping(address => uint) refunds;

  function bid() payable {
    require(msg.value > currentBid);
    if (currentFrontrunner != 0) {
      refunds[currentFrontrunner] += currentBid;
    }
    currentFrontrunner = msg.sender;
    currentBid         = msg.value;
  }

  function withdrawRefund() {
    uint refund = refunds[msg.sender];
    refunds[msg.sender] = 0;
    msg.sender.transfer(refund);
  }
}
