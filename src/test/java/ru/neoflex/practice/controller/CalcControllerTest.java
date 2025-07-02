package ru.neoflex.practice.controller;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.test.web.servlet.MockMvc;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@WebMvcTest(controllers = CalcController.class)
public class CalcControllerTest {

    @Autowired
    MockMvc mvc;

    @Test
    void testAdd() throws Exception {
        mvc.perform(get("/plus/45/19"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$").value("64"));
    }

    @Test
    void testSubtract() throws Exception {
        mvc.perform(get("/minus/28/75"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$").value("-47"));
    }

    @Test
    void testAddWithNegative() throws Exception {
        mvc.perform(get("/plus/-42/19"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$").value("-23"));
    }
}
