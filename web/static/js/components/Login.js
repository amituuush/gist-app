import React from "react";
import axios from "axios";
import { Link, Redirect } from 'react-router-dom';
import { Alert } from 'reactstrap';
import AuthService from "./AuthService";

class Login extends React.Component {
  constructor() {
    super();
    this.state = {
      username: '',
      password: '',
      redirect: false,
      failedLoginAttempt: false
    };
  }

  handleUsername(event) {
    this.setState({ username: event.target.value })
  }

  handlePassword(event) {
    this.setState({ password: event.target.value })
  }

  handleSubmit (event) {
    event.preventDefault();

    axios({
      method: 'post',
      headers: {
        "Content-Type": "application/json",
      },
      url: 'http://localhost:4004/api/sessions',
      data: {
          username: this.state.username,
          password: this.state.password
      }
    })
    .then((res) => {
      AuthService.setToken(res.data.meta.token)
      console.log(res);
      this.props.authUser();
      this.setState({ redirect: true });
    })
    .catch((err) => {
      if (err.response.status === 401) {
        this.setState({ failedLoginAttempt: true });
      }
    })
  }

  render() {
    let failedAlert;
    if (this.state.redirect) {
      return <Redirect to={"/gists"} />;
    }

    if (this.state.failedLoginAttempt) {
      failedAlert = (
        <Alert color="warning" fade={false}>
          That's an invalid username/password...try again!
        </Alert>
      )
    }

    return (
      <div>
        <form onSubmit={this.handleSubmit.bind(this)}>
          <div className="field">
            <label className="label">Username</label>
            <div className="control">
              <input
                className="input"
                type="text"
                value = {this.state.username}
                onChange = {this.handleUsername.bind(this)}
              />
            </div>
          </div>
          <div className="field">
            <label className="label">Password</label>
            <div className="control">
              <input
                className="input"
                type="password"
                value = {this.state.password}
                onChange = {this.handlePassword.bind(this)}
              />
            </div>
          </div>
          {failedAlert}
          <button
            type="submit"
            value="Submit"
            className="button is-primary"
          >
          Submit
          </button>
        </form>
      </div>
    );
  }
}

export default Login;