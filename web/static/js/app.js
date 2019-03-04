import "phoenix_html";
import React from "react";
import ReactDOM from "react-dom";
import { BrowserRouter as Router, Route, Link } from 'react-router-dom';
import { BrowserRouter } from 'react-router-dom';
import Signup from "./components/Signup";
import Login from "./components/Login";
import Gists from "./components/Gists";
import Navigation from "./components/Navigation";
import AuthService from "./components/AuthService";

class App extends React.Component {
  constructor() {
    super();
    this.state = {
      isAuthed: false
    };

    this.authUser = this.authUser.bind(this);
  }

  authUser() {
    this.setState({ isAuthed: true });
  }

  render() {
    return (
      <div>
        <Router>
          <div>
            <Navigation isAuthed={this.state.isAuthed} />

            <Route exact path="/"
              render={(props) => <Signup {...props} authUser={this.authUser} />} />
            <Route exact path="/login"
              render={(props) => <Login {...props} authUser={this.authUser} />} />
            <Route exact path="/gists" component={Gists} />
          </div>
        </Router>
      </div>
    );
  }
}

ReactDOM.render(
  <BrowserRouter>
    <App/>
  </BrowserRouter>,
  document.getElementById("app")
);