import React from "react";
import axios from "axios";
import { Link, Redirect } from 'react-router-dom';
import { Navbar, NavbarBrand, Nav, NavItem, NavLink } from 'reactstrap';
import AuthService from "./AuthService";

class Navigation extends React.Component {
  constructor() {
    super();
    this.state = {
      redirect: false
    };
  }

  handleLogout (event) {
    event.preventDefault();

    axios({
      method: 'delete',
      headers: {"Content-Type": "application/json"},
      url: 'http://localhost:4004/api/sessions',
    })
    .then((response) => {
      AuthService.logout();
      this.setState({ redirect: true });
      console.log(response);
    });
  }

  render() {
    let { redirect } = this.state;
    let navLinks;

    if (this.state.redirect) { return <Redirect to={"/"} />; }

    if (this.props.isAuthed) {
      navLinks = (
        <NavItem>
          <NavLink href="/" onClick={this.handleLogout.bind(this)}>
              Logout
          </NavLink>
        </NavItem>
      );
    } else {
      navLinks = (
        <div>
          <NavItem>
            <NavLink href="/components/">Sign Up</NavLink>
          </NavItem>
          <NavItem>
            <NavLink href="https://github.com/reactstrap/reactstrap">Log In</NavLink>
          </NavItem>
        </div>
      );
    }

    return (
      <div className="nav">
        <Navbar color="light" light expand="md">
          <NavbarBrand href="/">Gist</NavbarBrand>
            <Nav className="ml-auto" navbar>
              {navLinks}
            </Nav>
        </Navbar>
      </div>
    );
  }
}

export default Navigation;