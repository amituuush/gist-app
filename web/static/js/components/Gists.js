import React from "react";
import axios from "axios";
import { Link } from 'react-router-dom';

class Login extends React.Component {
  constructor() {
    super();

    this.state = {
      redirect: false
    };
  }

  handleSubmit (event) {
    event.preventDefault();

    axios({
      method: 'delete',
      headers: {"Content-Type": "application/json"},
      url: 'http://localhost:4004/api/sessions',
    })
    .then((response) => {
      this.setState({ redirect: true });
      console.log(response);
    });
  }

  render() {
    let { redirect } = this.state;

    if (this.state.redirect) {
      return <Redirect to={"/signup"} />;
    }

    return (
      <div>
        <button
          onClick={this.handleSubmit.bind(this)}
          className="button is-info" >
          Logout
        </button>
      </div>
    );
  }
}

export default Login;