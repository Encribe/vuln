// Derived fix of SWC-128 dos_number.sol (MIT): the batch size is capped and
// clearing resets a counter instead of rewriting the array.
pragma solidity ^0.4.25;

contract DosNumberBounded {
    uint constant MAX_BATCH = 100;
    uint numElements = 0;
    uint[] array;

    function insertNnumbers(uint value, uint numbers) public {
        require(numbers <= MAX_BATCH);
        for (uint i = 0; i < numbers; i++) {
            if (numElements == array.length) {
                array.length += 1;
            }
            array[numElements++] = value;
        }
    }

    function clear() public {
        require(numElements > 1500);
        numElements = 0;
    }

    function getLengthArray() public view returns (uint) {
        return numElements;
    }
}
