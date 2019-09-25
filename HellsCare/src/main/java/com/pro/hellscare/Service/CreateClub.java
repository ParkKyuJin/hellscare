package com.pro.hellscare.Service;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.Callable;
import org.web3j.abi.EventEncoder;
import org.web3j.abi.TypeReference;
import org.web3j.abi.datatypes.Address;
import org.web3j.abi.datatypes.Event;
import org.web3j.abi.datatypes.Function;
import org.web3j.abi.datatypes.Type;
import org.web3j.abi.datatypes.generated.Bytes32;
import org.web3j.abi.datatypes.generated.StaticArray10;
import org.web3j.abi.datatypes.generated.Uint256;
import org.web3j.crypto.Credentials;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.core.DefaultBlockParameter;
import org.web3j.protocol.core.RemoteCall;
import org.web3j.protocol.core.methods.request.EthFilter;
import org.web3j.protocol.core.methods.response.Log;
import org.web3j.protocol.core.methods.response.TransactionReceipt;
import org.web3j.tuples.generated.Tuple2;
import org.web3j.tx.Contract;
import org.web3j.tx.TransactionManager;
import org.web3j.tx.gas.ContractGasProvider;
import rx.Observable;
import rx.functions.Func1;

/**
 * <p>Auto generated code.
 * <p><strong>Do not modify!</strong>
 * <p>Please use the <a href="https://docs.web3j.io/command_line.html">web3j command line tools</a>,
 * or the org.web3j.codegen.SolidityFunctionWrapperGenerator in the 
 * <a href="https://github.com/web3j/web3j/tree/master/codegen">codegen module</a> to update.
 *
 * <p>Generated with web3j version 3.6.0.
 */
public class CreateClub extends Contract {
    private static final String BINARY = "608060405234801561001057600080fd5b50600180546001600160a01b031916331790556103c4806100326000396000f3fe6080604052600436106100555760003560e01c806330e300151461005a5780634ca0eecd1461007f57806363d0e8ab146100cc5780638da5cb5b1461011a578063c37c656d1461014b578063d040a2fe14610175575b600080fd5b61007d6004803603604081101561007057600080fd5b508035906020013561019f565b005b34801561008b57600080fd5b506100a9600480360360208110156100a257600080fd5b503561027e565b604080516001600160a01b03909316835260208301919091528051918290030190f35b3480156100d857600080fd5b506100e16102c2565b604051808261014080838360005b838110156101075781810151838201526020016100ef565b5050505090500191505060405180910390f35b34801561012657600080fd5b5061012f610308565b604080516001600160a01b039092168252519081900360200190f35b34801561015757600080fd5b5061012f6004803603602081101561016e57600080fd5b5035610317565b34801561018157600080fd5b506100a96004803603602081101561019857600080fd5b5035610334565b60098211156101ad57600080fd5b33600283600a81106101bb57fe5b0180546001600160a01b039283166001600160a01b031991821617909155604080518082018252338152602080820186815260008881529182905283822092518354908716951694909417825592516001918201555490519216913480156108fc0292909190818181858888f1935050505015801561023e573d6000803e3d6000fd5b50604080513381526020810184905281517fb2dd8e8fbbbdd10a8d5093a06491a727ceaac359031a6682886d0e3f0319e1f3929181900390910190a15050565b600080610289610359565b50505060009081526020818152604091829020825180840190935280546001600160a01b03168084526001909101549290910182905291565b6102ca610370565b6040805161014081019182905290600290600a9082845b81546001600160a01b031681526001909101906020018083116102e1575050505050905090565b6001546001600160a01b031681565b600281600a811061032457fe5b01546001600160a01b0316905081565b600060208190529081526040902080546001909101546001600160a01b039091169082565b604080518082019091526000808252602082015290565b604051806101400160405280600a90602082028038833950919291505056fea265627a7a7231582091a20e9e1bef7458d8bce600f478e59ee607d15a3779638e0f26c6054167217764736f6c634300050b0032";

    public static final String FUNC_NEWCREATECLUB = "newCreateClub";

    public static final String FUNC_GETCAPINFO = "getCapInfo";

    public static final String FUNC_GETALLCAP = "getAllCap";

    public static final String FUNC_OWNER = "owner";

    public static final String FUNC_CAPS = "caps";

    public static final String FUNC_CAPINFO = "capInfo";

    public static final Event LOGNEWCREATECLUB_EVENT = new Event("LogNewCreateClub", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Address>() {}, new TypeReference<Uint256>() {}));
    ;

    @Deprecated
    protected CreateClub(String contractAddress, Web3j web3j, Credentials credentials, BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    protected CreateClub(String contractAddress, Web3j web3j, Credentials credentials, ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, credentials, contractGasProvider);
    }

    @Deprecated
    protected CreateClub(String contractAddress, Web3j web3j, TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    protected CreateClub(String contractAddress, Web3j web3j, TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public RemoteCall<TransactionReceipt> newCreateClub(BigInteger _id, byte[] _name, BigInteger weiValue) {
        final Function function = new Function(
                FUNC_NEWCREATECLUB, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint256(_id), 
                new org.web3j.abi.datatypes.generated.Bytes32(_name)), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function, weiValue);
    }

    public RemoteCall<Tuple2<String, byte[]>> getCapInfo(BigInteger _id) {
        final Function function = new Function(FUNC_GETCAPINFO, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint256(_id)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Address>() {}, new TypeReference<Bytes32>() {}));
        return new RemoteCall<Tuple2<String, byte[]>>(
                new Callable<Tuple2<String, byte[]>>() {
                    @Override
                    public Tuple2<String, byte[]> call() throws Exception {
                        List<Type> results = executeCallMultipleValueReturn(function);
                        return new Tuple2<String, byte[]>(
                                (String) results.get(0).getValue(), 
                                (byte[]) results.get(1).getValue());
                    }
                });
    }

    public RemoteCall<List> getAllCap() {
        final Function function = new Function(FUNC_GETALLCAP, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<StaticArray10<Address>>() {}));
        return new RemoteCall<List>(
                new Callable<List>() {
                    @Override
                    @SuppressWarnings("unchecked")
                    public List call() throws Exception {
                        List<Type> result = (List<Type>) executeCallSingleValueReturn(function, List.class);
                        return convertToNative(result);
                    }
                });
    }

    public RemoteCall<String> owner() {
        final Function function = new Function(FUNC_OWNER, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Address>() {}));
        return executeRemoteCallSingleValueReturn(function, String.class);
    }

    public RemoteCall<String> caps(BigInteger param0) {
        final Function function = new Function(FUNC_CAPS, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint256(param0)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Address>() {}));
        return executeRemoteCallSingleValueReturn(function, String.class);
    }

    public RemoteCall<Tuple2<String, byte[]>> capInfo(BigInteger param0) {
        final Function function = new Function(FUNC_CAPINFO, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint256(param0)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Address>() {}, new TypeReference<Bytes32>() {}));
        return new RemoteCall<Tuple2<String, byte[]>>(
                new Callable<Tuple2<String, byte[]>>() {
                    @Override
                    public Tuple2<String, byte[]> call() throws Exception {
                        List<Type> results = executeCallMultipleValueReturn(function);
                        return new Tuple2<String, byte[]>(
                                (String) results.get(0).getValue(), 
                                (byte[]) results.get(1).getValue());
                    }
                });
    }

    public static RemoteCall<CreateClub> deploy(Web3j web3j, Credentials credentials, ContractGasProvider contractGasProvider) {
        return deployRemoteCall(CreateClub.class, web3j, credentials, contractGasProvider, BINARY, "");
    }

    public static RemoteCall<CreateClub> deploy(Web3j web3j, TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        return deployRemoteCall(CreateClub.class, web3j, transactionManager, contractGasProvider, BINARY, "");
    }

    // deploy 사용한 메소드
    @Deprecated
    public static RemoteCall<CreateClub> deploy(Web3j web3j, Credentials credentials, BigInteger gasPrice, BigInteger gasLimit) {
        return deployRemoteCall(CreateClub.class, web3j, credentials, gasPrice, gasLimit, BINARY, "");
    }

    @Deprecated
    public static RemoteCall<CreateClub> deploy(Web3j web3j, TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        return deployRemoteCall(CreateClub.class, web3j, transactionManager, gasPrice, gasLimit, BINARY, "");
    }

    public List<LogNewCreateClubEventResponse> getLogNewCreateClubEvents(TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = extractEventParametersWithLog(LOGNEWCREATECLUB_EVENT, transactionReceipt);
        ArrayList<LogNewCreateClubEventResponse> responses = new ArrayList<LogNewCreateClubEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            LogNewCreateClubEventResponse typedResponse = new LogNewCreateClubEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse._cap = (String) eventValues.getNonIndexedValues().get(0).getValue();
            typedResponse._id = (BigInteger) eventValues.getNonIndexedValues().get(1).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public Observable<LogNewCreateClubEventResponse> logNewCreateClubEventObservable(EthFilter filter) {
        return web3j.ethLogObservable(filter).map(new Func1<Log, LogNewCreateClubEventResponse>() {
            @Override
            public LogNewCreateClubEventResponse call(Log log) {
                Contract.EventValuesWithLog eventValues = extractEventParametersWithLog(LOGNEWCREATECLUB_EVENT, log);
                LogNewCreateClubEventResponse typedResponse = new LogNewCreateClubEventResponse();
                typedResponse.log = log;
                typedResponse._cap = (String) eventValues.getNonIndexedValues().get(0).getValue();
                typedResponse._id = (BigInteger) eventValues.getNonIndexedValues().get(1).getValue();
                return typedResponse;
            }
        });
    }

    public Observable<LogNewCreateClubEventResponse> logNewCreateClubEventObservable(DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(LOGNEWCREATECLUB_EVENT));
        return logNewCreateClubEventObservable(filter);
    }

    // 이더전송에 사용한 메소드(계약hashcode, 서버, 계정, gasprice, gaslimit)
    @Deprecated
    public static CreateClub load(String contractAddress, Web3j web3j, Credentials credentials, BigInteger gasPrice, BigInteger gasLimit) {
        return new CreateClub(contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    @Deprecated
    public static CreateClub load(String contractAddress, Web3j web3j, TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        return new CreateClub(contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    public static CreateClub load(String contractAddress, Web3j web3j, Credentials credentials, ContractGasProvider contractGasProvider) {
        return new CreateClub(contractAddress, web3j, credentials, contractGasProvider);
    }

    public static CreateClub load(String contractAddress, Web3j web3j, TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        return new CreateClub(contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public static class LogNewCreateClubEventResponse {
        public Log log;

        public String _cap;

        public BigInteger _id;
    }
}
