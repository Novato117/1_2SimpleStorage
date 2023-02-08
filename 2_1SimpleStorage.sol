// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract SimpleStorage{
    //variables
    address public owner;
    uint storedInt;
    string storeString;
    uint[] public arrayInt;//arreglo -accedemos al arreglo
    //eventos
    /*
    *Los eventos generan un log en la consola de la EVM, y pueden ser escuchados por otras aplicaciones 
    * y otros contratos
    * se declaran los eventos
    */
    event SetInt(uint set);//emite el entero que se recibio
event SetString(string set);
event PushToArray(uint pushed);

    //modificadores
    /*
    *son funciones que se llaman antes de la ejecucion de una funcion 
    *Sirven para restringir accesos
    * sele pone onlyOwner a las funciones que solo debe ejecutar el owner
    */
    modifier onlyOwner{
        require(msg.sender==owner);
        _;
    }
    //constructor
    constructor(){
        owner.msg.sender;//contiene la direccion de quien ejecuto el contrato
    }
    //funciones

/*
*function <name>(<type> parametro)->
*<access> --tipo de acceso a la funcion
*<mutability>---Escritura / lecutra en el estado de ethereum
*<modifiers> --funcion modificadora
*<returns(<type>)>--retornocon su tipo correspondiente
*<content> cuerpo de la funcion
*/
function setInt(uint _storedInt)public onlyOwner{
    storedInt=_storedInt;
    emit SetInt(_storedInt)//emite lo que acaba de recibir
}

function getInt() public view returns(uint){
    return storedInt;
}
function setSring(string memory _storedString)public onlyOwner
    storeString=_storedString;
    emit SetString(_storedString);
}
function getString()public view returns(string memory){//string memori ->Es memoria volatil,se guarda
//solamente durante el tiempo de ejecucion 
    return storeString;
}
function pushArray(uint toPush) public onlyOwner{
    arrayInt.push(toPush);//ingresar datos a el arreglo
    emit PushToArray(toPush);
}
/*
view -> no cobra en blockachain
revert() -> para la ejecucuin del contrato
require()->recibe una operacion bool , si la operacion bool es correcta avanza, si no se detiene y se revierte
*/


}