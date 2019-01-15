import React from "react";
import axios from "axios";
import { Link } from 'react-router-dom';
import { Navbar, NavbarBrand, Nav, NavItem, NavLink } from 'reactstrap';
import AuthService from "./AuthService";


class Navigation extends React.Component {
  handleSubmit (event) {
    event.preventDefault();

    axios({
      method: 'delete',
      headers: {"Content-Type": "application/json"},
      url: 'http://localhost:4004/api/sessions',
    })
    .then((response) => {
      AuthService.logout();
      console.log(response);
    });
  }

  render() {
    let navLinks;

    if (this.props.isAuthed) {
      navLinks = (
        <NavItem>
          <NavLink href="/" onClick={this.handleSubmit.bind(this)}>
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