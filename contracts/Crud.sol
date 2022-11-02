pragma solidity ^0.8.0;

contract crud {
    struct employee {
        string name;
        uint256 age;
        string email;
        address walletAddress;
    }

    employee[] public employees;

    uint256 public totalEmployees;

    constructor() {
        totalEmployees = 0;
    }

    function create(
        string memory name,
        string memory email,
        uint256 age,
        address walletAddress
    ) public returns (uint256 _totalEmployees) {
        employee memory newEmployee = employee(name, age, email, walletAddress);
        employees.push(newEmployee);
        totalEmployees++;
        return _totalEmployees;
    }

    function updateEmployee(string memory name, string memory email)
        external
        returns (bool)
    {
        for (uint256 i = 0; i < employees.length; i++) {
            if (compareString(employees[i].email, email)) {
                employees[i].name = name;
                return true;
            }
        }
        return false;
    }

    function DeleteEmployee(string memory email) external returns (bool) {
        require(totalEmployees > 0);
        for (uint256 i = 0; i < employees.length; i++) {
            if (compareString(employees[i].email, email)) {
                employees[i] = employees[totalEmployees - 1];
                delete employees[totalEmployees - 1];
                totalEmployees--;
                return true;
            }
        }
        return false;
    }




    function compareString(string memory a, string memory b)
        internal
        pure
        returns (bool)
    {
        return keccak256(abi.encodePacked(a)) == keccak256(abi.encodePacked(b));
    }
}
