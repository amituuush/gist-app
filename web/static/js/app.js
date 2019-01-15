import "phoenix_html";
import React from "react";
import ReactDOM from "react-dom";
import { BrowserRouter as Router, Route, Link } from 'react-router-dom';
import Signup from "./components/Signup";
import Login from "./components/Login";
import Gists from "./components/Gists";
import Navigation from "./components/Navigation";

class App extends React.Component {
  render() {
    return (
      <div>
        <Navigation />
        <Router>
          <div>
            <Route exact path="/" component={Signup}/>
            <Route exact path="/gists" component={Gists}/>
            <Route exact path="/login" component={Login}/>
          </div>
        </Router>
      </div>
    );
  }
}

ReactDOM.render(
  <App/>,
  document.getElementById("app")
);