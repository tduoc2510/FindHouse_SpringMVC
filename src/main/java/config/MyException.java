package config;

import org.springframework.stereotype.Component;

//@Component
public class MyException extends RuntimeException {

    private static final long serialVersionUID = 1L;
    private String errCode;
    private String errMsg;

    public MyException() {
    }
// getter and setter methods

    public String getErrCode() {
        return errCode;
    }

    public void setErrCode(String errCode) {
        this.errCode = errCode;
    }

    public String getErrMsg() {
        return errMsg;
    }

    public void setErrMsg(String errMsg) {
        this.errMsg = errMsg;
    }
}
