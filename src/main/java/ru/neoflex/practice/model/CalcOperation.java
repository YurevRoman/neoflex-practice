package ru.neoflex.practice.model;

import jakarta.persistence.*;

@Entity
@Table(name = "caclOperations")
public class CalcOperation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String operation;
    private int operand1;
    private int operand2;
    private int result;

    public CalcOperation() {}

    public CalcOperation(String operation, int operand1, int operand2, int result) {
        this.operation = operation;
        this.operand1 = operand1;
        this.operand2 = operand2;
        this.result = result;
    }

    @Column(name = "ID")
    public int getId() {return id;}
    public void setId(int id) {}

    @Column(name = "OPERATION")
    public String getOperation() {return operation;}
    public void setOperation(String operation) {this.operation = operation;}

    @Column(name = "OPERAND1")
    public int getOperand1() {return operand1;}
    public void setOperand1(int operand1) {this.operand1 = operand1;}

    @Column(name = "OPERAND2")
    public int getOperand2() {return operand2;}
    public void setOperand2(int operand2) {this.operand2 = operand2;}

    @Column(name = "RESULT")
    public int getResult() {return result;}
    public void setResult(int result) {}
}