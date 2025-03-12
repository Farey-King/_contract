// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract AjorNFT is ERC721 {
    using Strings for uint256;

    uint256 public tokenIdAjor;
    mapping(address => uint256) public ajorContribution;
    mapping(address => bool) public isMinted;

    event Ajor(address indexed member, uint256 amount);
    event MintedNFT(address indexed user, uint256 tokenId);

    constructor() ERC721("AjorNFT", "ANFT") {}

    function deposit() external payable {
        require(msg.value > 0, "Deposit should be greater than 0");

        ajorContribution[msg.sender] += msg.value;

        emit Ajor(msg.sender, msg.value);

        if (!isMinted[msg.sender]) {
            _mintNFT(msg.sender);
        }
    }

    function _mintNFT(address user) internal {
        uint256 tokenId = tokenIdAjor;
        _safeMint(user, tokenId);
        isMinted[user] = true;
        tokenIdAjor++;

        emit MintedNFT(user, tokenId); //  Now `tokenId` is properly defined
    }

    // /// @notice Generates metadata dynamically and returns it as Base64 JSON
    // function tokenURI(uint256 tokenId) public view override returns (string memory) {
    //     require(_exists(tokenId), "NFT does not exist");

    //     string memory json = string(abi.encodePacked(
    // '{"name": "AjorNFT #', tokenId.toString(),
    // '", "description": "A fully on-chain NFT!", "image": "data:image/svg+xml;base64,',
    // generateSVG(tokenId),
    //     '"}'
    //     ));

    //     return string(abi.encodePacked("data:application/json;base64,", encodeBase64(bytes(json))));
    // }

    /// @notice Generates an SVG image dynamically based on tokenId
    function generateSVG(uint256 tokenId) internal pure returns (string memory) {
        string memory svg = string(
            abi.encodePacked(
                '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 200">',
                '<rect width="100%" height="100%" fill="blue"/>',
                '<text x="50%" y="50%" fill="white" font-size="20" text-anchor="middle">NFT #',
                tokenId.toString(),
                "</text></svg>"
            )
        );

        return encodeBase64(bytes(svg));
    }

    /// @notice Encodes bytes to Base64 (Use a proper Base64 library in production)
    function encodeBase64(bytes memory data) internal pure returns (string memory) {
        return string(abi.encodePacked(data)); // Replace with a real Base64 encoding library
    }
}
