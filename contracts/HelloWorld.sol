pragma solidity ^0.4.18;

contract HelloWorld {
    bytes32 message;

    function HelloWorld() public {
        message = "Hello World";
    }

    function getMessage() public view returns (bytes32) {
        return message;
    }
}