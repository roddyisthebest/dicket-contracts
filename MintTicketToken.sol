// SPDX-License-Identifier : MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";


contract MintTicketToken is ERC721Enumerable{
    constructor() ERC721("h662Animals","HAS"){}


    function mintTicketToken(uint ticketAmount) public returns(uint256[] memory) {
        
        uint256[] memory onSaleTicketTokenArray = new uint256[](ticketAmount);

        for(uint256 i =0 ; i<ticketAmount; i++){
            uint256 ticketTokenId = totalSupply() + 1;//nft가 가질수 있는 유일한 id인데 ERC721Enumerable에서 제공.. 지금까지 발행된 nft양        
            _mint(msg.sender,ticketTokenId); // 주인, 유일id - nft를 증명하는 토큰아이디
            onSaleTicketTokenArray[i]=ticketTokenId;
        }

        return onSaleTicketTokenArray;
        
    }


}