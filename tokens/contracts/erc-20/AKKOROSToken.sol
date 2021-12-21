// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.8.0;

import "@openzeppelin/contracts-upgradeable/proxy/Initializable.sol";

import "@openzeppelin/contracts-upgradeable/token/ERC20/ER20Upgradeable.sol";

contract AKKOROSToken is ERC20Upgradeable,ERC20Burnable {
    public minting_contract;
    function ERC20_init(address _minting_contract) internal initializer {
        __ERC20_init("Akkoros Token", "AKTK");
        minting_contract = _minting_contract;
    }

    // Reward

    function reward(address _to, uint256 _amount) public {
        require(_amount > 0);
        require(msg.sender == minting_contract);
        super._mint(_to, _amount);
    }

    
    /**
     * @dev Destroys `amount` tokens from the caller.
     *
     * See {ERC20-_burn}.
     */
    function burn(uint256 amount) public virtual {
        super._burn(_msgSender(), amount);
    }

}