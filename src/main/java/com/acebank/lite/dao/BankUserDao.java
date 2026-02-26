package com.acebank.lite.dao;

import com.acebank.lite.models.*;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

public interface BankUserDao {

    String getPasswordHash(int accountNo) throws SQLException;

    boolean login(int accountNo, String password) throws SQLException;

    boolean signUp(User user, int accountNo) throws SQLException;

    LoginResult getUserDetails(int accountNo) throws SQLException;

    boolean deposit(int accountNo, BigDecimal amount) throws SQLException;

    boolean withdraw(int accountNo, BigDecimal amount) throws SQLException;

    BigDecimal getDailyWithdrawalTotal(int accountNo) throws SQLException;

    boolean transfer(int fromAccount, int toAccount, BigDecimal amount) throws SQLException;

    List<Transaction> getStatement(int accountNo) throws SQLException;

    // ✅ FIXED METHOD
    boolean updatePassword(int accountNo, String newHashedPassword) throws SQLException;

    Optional<AccountRecoveryDTO> getRecoveryDetails(String email) throws SQLException;

    boolean accountExists(int accountNo) throws SQLException;

    BigDecimal getBalance(int accountNo) throws SQLException;

    List<Transaction> getTransactionsBetween(int accountNo, LocalDateTime start, LocalDateTime end);

    boolean saveOtp(String email, String otp, LocalDateTime expiry) throws SQLException;

    Optional<Integer> verifyOtp(String email, String otp) throws SQLException;

    boolean markOtpUsed(int otpId) throws SQLException;

    boolean updatePasswordByEmail(String email, String hashedPassword) throws SQLException;


}