// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract VerifySig {

    /*
    Verify Signature
        簽名
        1. 新增一筆簽名訊息
        2. Hash(訊息)
        3. Sign(Hash(訊息), 私鑰)  (off chain)
        4. ecrecover(Hash(訊息), 簽名) == signer
    */


    function verify(address _signer, string memory _message, bytes memory _sig)
        external pure returns (bool)
    {
        bytes32 messageHash = getMessageHash(_message);
        bytes32 ethSignedMessageHash = getEthSignedMessageHash(messageHash);

        return recover(ethSignedMessageHash, _sig) == _signer;
    }

    function getMessageHash(string memory _message) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_message));
    }

    function getEthSignedMessageHash(bytes32 _messageHash) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_messageHash));
    }

    function recover(bytes32 _ethSignedMessageHash, bytes memory _sig)
        public pure returns (address)
    {
        (bytes32 r, bytes32 s, uint8 v) = _split(_sig);
        return ecrecover(_ethSignedMessageHash, v, r, s);
    }

    function _split(bytes memory _sig) internal pure
        returns (bytes32 r, bytes32 s, uint8 v)
    {
        // 65 = 32 + 32 + 1
        require(_sig.length == 65, "invalid signature length");

        assembly {
            /*
              mload 表示讀取一個指定位址中 32 bytes 的資料
              add 表示將兩個位址相加，返回相加後的位址
            */
            
            // first 32 bytes
            r := mload(add(_sig, 32))
            // second 32 bytes
            s := mload(add(_sig, 64))
            // final byte (first byte of the next 32 bytes)
            v := byte(0, mload(add(_sig, 96)))
        } // return (r, s, v)
    }
}