package com.lacebank.models;

public record Transaction(
    Integer id,
    Integer senderAccount,
    Integer receiverAccount,
    java.math.BigDecimal amount,
    String txType,
    String remark,
    java.time.LocalDateTime createdAt
) {}