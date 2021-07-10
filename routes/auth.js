"use strict";

/** Routes for authentication. */

const jsonschema = require("jsonschema");

const User = require("../models/user");
const Company = require("../models/company");
const express = require("express");
const router = new express.Router();
const { createToken } = require("../helpers/tokens");
const userAuthSchema = require("../schemas/userAuth.json");
const companyAuthSchema = require("../schemas/companyAuth.json");
const userRegisterSchema = require("../schemas/userRegister.json");
const companyRegisterSchema = require("../schemas/companyRegister.json");
const { BadRequestError } = require("../expressError");

/** POST /auth/login-user:  { username, password } => { token }
 *
 * Returns JWT token which can be used to authenticate further requests. 
 */

router.post("/login-user", async function (req, res, next) {
  try {
    const validator = jsonschema.validate(req.body, userAuthSchema);
    if (!validator.valid) {
      const errs = validator.errors.map(e => e.stack);
      throw new BadRequestError(errs);
    }

    const { username, password } = req.body;
    const user = await User.authenticate(username, password);
    const token = createToken(user);
    return res.json({ token });
  } catch (err) {
    return next(err);
  }
}); 

/** POST /auth/login-company:  { companyHandle, password } => { token }
 *
 * Returns JWT token which can be used to authenticate further requests. 
 */

router.post("/login-company", async function (req, res, next) {
  try {
    const validator = jsonschema.validate(req.body, companyAuthSchema);
    if (!validator.valid) {
      const errs = validator.errors.map(e => e.stack);
      throw new BadRequestError(errs);
    }

    const { companyHandle, password } = req.body;
    const company = await Company.authenticate(companyHandle, password);
    const token = createToken(company);
    return res.json({ token });
  } catch (err) {
    return next(err);
  }
});


/** POST /auth/register-user:   { user } => { token }
 *
 * user must include { username, password, firstName, lastName, email, skill }
 *
 * Returns JWT token which can be used to authenticate further requests.
 */

router.post("/register-user", async function (req, res, next) {
  try {
    const validator = jsonschema.validate(req.body, userRegisterSchema);
    if (!validator.valid) {
      const errs = validator.errors.map(e => e.stack);
      throw new BadRequestError(errs);
    }

    const newUser = await User.register({ ...req.body });
    const token = createToken(newUser);
    return res.status(201).json({ token });
  } catch (err) {
    return next(err);
  }
});


/** POST /auth/register-company:   { company } => { token } 
 *
 * Returns JWT token which can be used to authenticate further requests.
 */

 router.post("/register-company", async function (req, res, next) {
  try {
    const validator = jsonschema.validate(req.body, companyRegisterSchema);
    if (!validator.valid) {
      const errs = validator.errors.map(e => e.stack);
      throw new BadRequestError(errs);
    }

    const newCompany = await Company.create({ ...req.body });
    const token = createToken(newCompany);
    return res.status(201).json({ token });
  } catch (err) {
    return next(err);
  }
});


module.exports = router;
