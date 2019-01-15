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


  render() {
    let { redirect } = this.state;

    if (this.state.redirect) {
      return <Redirect to={"/signup"} />;
    }

    return (
      <div>
        Gist Feed
      </div>
    );
  }
}

export default Login;