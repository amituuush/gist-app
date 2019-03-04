import React from "react";
import AuthService from "./AuthService";
import axios from "axios";
import { Link, Redirect } from 'react-router-dom';

class Signup extends React.Component {
  constructor() {
    super();
    this.state = {
      username: '',
      password: '',
      redirect: false
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
      headers: {"Content-Type": "application/json"},
      url: 'http://localhost:4004/api/users',
      data: {
        users: {
          username: this.state.username,
          password: this.state.password
        }
      }
    })
    .then((res) => {
      AuthService.setToken(res.data.meta.token)
      console.log(res);
      this.props.authUser();
      this.setState({ redirect: true });
    });
  }

  render() {
    if (this.state.redirect) {
      return <Redirect to={"/gists"} />;
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
                onChange = {this.handleUsername.bind(this)} />
            </div>
          </div>
          <div className="field">
            <label className="label">Password</label>
            <div className="control">
              <input
                className="input"
                type="text"
                value = {this.state.password}
                onChange = {this.handlePassword.bind(this)} />
            </div>
          </div>
          <button
            type="submit"
            value="Submit"
            className="button is-primary">
          Submit
          </button>
        </form>
      </div>
    );
  }
}
export default Signup;