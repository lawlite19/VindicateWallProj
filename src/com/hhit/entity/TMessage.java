package com.hhit.entity;

import java.sql.Timestamp;


/**
 * TMessage entity. @author MyEclipse Persistence Tools
 */

public class TMessage  implements java.io.Serializable {


    // Fields    

     private Long id;
     private TReleasecontent TReleasecontent;
     private TReplay TReplay;
     private TUser TUser;
     private String receiveRealName;
     private String msgContent;
     private String msgType;
     private Timestamp postTime;


    // Constructors

    /** default constructor */
    public TMessage() {
    }

    
    /** full constructor */
    public TMessage(TReleasecontent TReleasecontent, TReplay TReplay, TUser TUser, String receiveRealName, String msgContent, String msgType, Timestamp postTime) {
        this.TReleasecontent = TReleasecontent;
        this.TReplay = TReplay;
        this.TUser = TUser;
        this.receiveRealName = receiveRealName;
        this.msgContent = msgContent;
        this.msgType = msgType;
        this.postTime = postTime;
    }

   
    // Property accessors

    public Long getId() {
        return this.id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }

    public TReleasecontent getTReleasecontent() {
        return this.TReleasecontent;
    }
    
    public void setTReleasecontent(TReleasecontent TReleasecontent) {
        this.TReleasecontent = TReleasecontent;
    }

    public TReplay getTReplay() {
        return this.TReplay;
    }
    
    public void setTReplay(TReplay TReplay) {
        this.TReplay = TReplay;
    }

    public TUser getTUser() {
        return this.TUser;
    }
    
    public void setTUser(TUser TUser) {
        this.TUser = TUser;
    }

    public String getReceiveRealName() {
        return this.receiveRealName;
    }
    
    public void setReceiveRealName(String receiveRealName) {
        this.receiveRealName = receiveRealName;
    }

    public String getMsgContent() {
        return this.msgContent;
    }
    
    public void setMsgContent(String msgContent) {
        this.msgContent = msgContent;
    }

    public String getMsgType() {
        return this.msgType;
    }
    
    public void setMsgType(String msgType) {
        this.msgType = msgType;
    }

    public Timestamp getPostTime() {
        return this.postTime;
    }
    
    public void setPostTime(Timestamp postTime) {
        this.postTime = postTime;
    }
   








}