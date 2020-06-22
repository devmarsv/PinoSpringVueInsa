package com.psi.myapp.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.psi.myapp.member.dto.Member;

public interface MemberMapper {
 public List<Member> getList(Member member);
 public void insertMember(Member m);
 public Member selectMember(int sabun);
 public int updateMember(Member member);
 public int idChk(Member member);
}
