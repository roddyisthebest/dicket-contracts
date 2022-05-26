pragma solidity ^0.8.0;

import "MintTicketToken.sol";

contract Manage {

    MintTicketToken public mintTicketToken;
    
    constructor (address _mintTicketTokenAddress) {
        mintTicketToken = MintTicketToken(_mintTicketTokenAddress);
    }

    function authTicketToken(uint256 _ticketTokenId) public returns(bool){
        address ticketTokenOwner = mintTicketToken.ownerOf(_ticketTokenId);

        require(ticketTokenOwner == msg.sender,"it is not yours");
        require(mintTicketToken.isApprovedForAll(ticketTokenOwner, address(this)), "ticket token owner did not approve token.");

        return true;
    }

    function saleTicketToken(uint256 _ticketTokenId)public payable{

        address ticketTokenOwner = mintTicketToken.ownerOf(_ticketTokenId);
        require(msg.value> 0, "ticket token not sale.");
        require(ticketTokenOwner != msg.sender, "Caller is ticket token owner.");

        payable(ticketTokenOwner).transfer(msg.value);
        mintTicketToken.safeTransferFrom(ticketTokenOwner, msg.sender, _ticketTokenId);
    }

}