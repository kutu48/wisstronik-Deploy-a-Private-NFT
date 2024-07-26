// contracts/MyPrivateNFT.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyPrivateNFT is ERC721, Ownable {
    uint256 private _tokenIds;
    mapping (uint256 => address) private _owners;

    constructor() ERC721("GJPrivateNFT", "GJNFT") {}

    function mint(address recipient) public onlyOwner returns (uint256) {
        _tokenIds++;
        uint256 newItemId = _tokenIds;
        _owners[newItemId] = recipient;
        _mint(address(this), newItemId);
        return newItemId;
    }

    function transfer(address recipient, uint256 tokenId) public onlyOwner {
        require(_owners[tokenId] == msg.sender, "Only owner can transfer");
        _owners[tokenId] = recipient;
        _transfer(address(this), recipient, tokenId);
    }

    function ownerOf(uint256 tokenId) public view override returns (address) {
        require(msg.sender == _owners[tokenId], "Caller is not the owner");
        return _owners[tokenId];
    }
}
